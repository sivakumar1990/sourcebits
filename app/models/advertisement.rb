class Advertisement < ActiveRecord::Base
  validates_presence_of :size, :price

  def self.get_lucrative_ads_combination
    ad_details = []
    all.each {|ad| ad_details << {ad.size => {"id" => ad.id, "price" => ad.price}}}

    one_limit_values = []
    ad_details.delete_if {|k| one_limit_values << [k] if (k.keys[0] == "3x3")}
    return_val = 2.upto(9).flat_map {|n| ad_details.combination(n).select {|x| if(evaluate_method(x));p x;end}}
    one_limit_values.each {|val| return_val << val}
    price_array = return_val.map {|ret_val| ret_val.inject(0) {|sum,hash| sum+hash.values[0]['price']}}

    max_price = price_array.max
    index_val = price_array.index(max_price)
    final_val = return_val[index_val]
    return final_val, max_price
  end

  def self.evaluate_method(arr_hash)
    arr_values = arr_hash.map {|d| d.keys}.flatten
    value = 0
    arr_values.each do |each_val|
      value += each_val[0].to_i * each_val[2].to_i
      return false if value > 9
    end
    value == 9 ? true : false
  end
end

file = File.read "access.log"

result = {}
file.split("\n").each do |line|
  elems = line.split("\t")
  key = elems[5].sub('method:','') + ',' + elems[6].sub('path:','')

  req_time = elems[1].sub('req_time:','').to_f
  app_time = elems[2].sub('app_time:','').to_f
  res_size = elems[3].sub('res_size:','').to_i

  unless result[key]
    result[key] = {
      "req_time" => req_time,
      "app_time" => app_time,
      "res_size" => res_size,
      "cnt" => 1
    }
  else
    result[key]["req_time"] += req_time
    result[key]["app_time"] += req_time
    result[key]["res_size"] += req_time
    result[key]["cnt"] += 1
  end
end

result.each do |k,v|
  puts k
  n = v["cnt"]

  v.each do |kk,vv|
    puts "\t#{kk}\t#{kk == "cnt"? vv : vv / n.to_f}"
  end
end

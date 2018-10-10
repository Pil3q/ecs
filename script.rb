files_list = Dir.children("sqlfiles")
db_status = 46

def newest_file_number(files_list)
  files_numbers = files_list.map { |file| file.gsub(/[^\d]/, '').to_i  }
  files_numbers.max
end

def find_files_to_exec(files_list, db_status)
  files_to_exec = files_list.select { |file| file if file.gsub(/[^\d]/, '').to_i > db_status  }
end

def sort_files_in_numerical_order(files_list)
  files_list.sort_by { |file| file[/\d+/].to_i }
end
files_not_in_order = ["088.nksfdls.sql", "001.dszdsd.sql", "0099dsksls.sql", "066sdlsld.sql"]
p sort_files_in_numerical_order(["045.somefile.sql", "022nodot.sql", "0002.moredigits.sql", "0095.lessdigits.sql"])

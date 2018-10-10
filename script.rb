files_list = Dir.children("sqlfiles")
def newest_file_number(files_list)
  files_numbers = files_list.map { |file| file.gsub(/[^\d]/, '').to_i  }
  files_numbers.max
end
p newest_file_number(files_list)

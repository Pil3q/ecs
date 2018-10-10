files_list = Dir.children("sqlfiles")
db_status = 46
def newest_file_number(files_list)
  files_numbers = files_list.map { |file| file.gsub(/[^\d]/, '').to_i  }
  files_numbers.max
end
def find_files_to_exec(files_list, db_status)
  files_to_exec = files_list.map { |file| file if file.gsub(/[^\d]/, '').to_i > db_status  }
  files_to_exec.compact
end

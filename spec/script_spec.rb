require_relative "../script"

test_files_names = ["045.somefile.sql", "022nodot.sql", "0002.moredigits.sql", "95.lessdigits.sql"]
db_status = 44

describe 'newest_file_number' do
  it 'finds the newest(highest) file number' do
    expect(newest_file_number(test_files_names)).to eq 95
  end
end
describe 'find_files_to_exec' do
  it 'finds the files that need to be executed' do
    expect(find_files_to_exec(test_files_names, db_status)).to eq ["045.somefile.sql", "95.lessdigits.sql"]
  end
end

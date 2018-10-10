require_relative "../script"

describe 'newest_file_number' do
  it 'finds the newest(highest) file number' do
    test_files_names = ["045.somefile.sql", "022nodot.sql", "0002.moredigits.sql", "95.lessdigits.sql"]
    expect(newest_file_number(test_files_names)).to eq 95
  end
end

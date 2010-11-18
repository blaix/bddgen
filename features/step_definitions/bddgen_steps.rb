Given /^a current working directory named "([^"]*)"$/ do |directory|
  @working_dir = directory
  Given "a directory named \"#{directory}\""
  Given "I cd to \"#{directory}\""
end

When /^the following files should be created:$/ do |table|
  table.raw.each do |row|
    row.each do |col|
      # can't use the aruba-provided step here because of a regex gotcha
      all_output.should =~ /create.+#{Regexp.escape(col)}/
      Then "a file named \"#{col}\" should exist"
    end
  end
end

Then /^the file "([^"]*)" should contain the cucumber tasks$/ do |file|
  tmp_dir = File.expand_path("../../tmp/aruba", File.dirname(__FILE__))
  contents = File.read(File.join(tmp_dir, @working_dir, file))
  contents.should include(BDDGen::Tasks.cucumber)
end

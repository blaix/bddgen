Given /^a current working directory named "([^"]*)"$/ do |directory|
  @working_dir = directory
  Given "a directory named \"#{directory}\""
  Given "I cd to \"#{directory}\""
end

Then /^the output should say the following files were created:$/ do |table|
  table.raw.each do |row|
    row.each do |col|
      # can't use the aruba-provided step here because of a regex gotcha
      all_output.should =~ /create.+#{Regexp.escape(col)}/
    end
  end
end

Then /^the following files should be created:$/ do |table|
  Then "the output should say the following files were created:", table
  Then "the following files should exist:", table
end

Then /^the file "([^"]*)" should contain the cucumber tasks$/ do |file|
  read_temp_file(file).should include(BDDGen::Tasks.cucumber)
end

Then /^the file "([^"]*)" should contain the rspec tasks$/ do |file|
  read_temp_file(file).should include(BDDGen::Tasks.rspec)
end

Then /^the file "([^"]*)" should contain the yard task$/ do |file|
  read_temp_file(file).should include(BDDGen::Tasks.yard(@working_dir))
end

Then /^the file "([^"]*)" should contain the yard task for "([^"]*)"$/ do |file, working_dir|
  read_temp_file(file).should include(BDDGen::Tasks.yard(working_dir))
end

Then /^the file "([^"]*)" should contain the bundler setup$/ do |file|
  Then "the file \"#{file}\" should contain \"require 'rubygems'\""
  Then "the file \"#{file}\" should contain \"require 'bundler'\""
  Then "the file \"#{file}\" should contain \"require 'bundler/setup'\""
end

Then /^the file "([^"]*)" should match the template "([^"]*)"$/ do |file, template|
  file_contents = read_temp_file(file)
  template = File.join(template_dir, template)
  File.should exist(template)
  template_contents = File.read(template)
  file_contents.strip.should == template_contents.strip
end

Then /^I should see the current version number$/ do
  Then "the output should contain \"#{BDDGen::VERSION}\""
end

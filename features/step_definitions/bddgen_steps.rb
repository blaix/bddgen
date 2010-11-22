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
  contents = File.read(File.join(tmp_dir, @working_dir, file))
  contents.should include(BDDGen::Tasks.cucumber)
end

Then /^the file "([^"]*)" should contain the rspec tasks$/ do |file|
  contents = File.read(File.join(tmp_dir, @working_dir, file))
  contents.should include(BDDGen::Tasks.rspec)
end

Then /^the file "([^"]*)" should contain the yard task$/ do |file|
  contents = File.read(File.join(tmp_dir, @working_dir, file))
  contents.should include(BDDGen::Tasks.yard(@working_dir))
end

Then /^the file "([^"]*)" should contain the bundler setup$/ do |file|
  Then "the file \"#{file}\" should contain \"require 'rubygems'\""
  Then "the file \"#{file}\" should contain \"require 'bundler'\""
  Then "the file \"#{file}\" should contain \"require 'bundler/setup'\""
end

Then /^the file "([^"]*)" should match the template "([^"]*)"$/ do |file, template|
  file_contents = File.read(File.join(tmp_dir, @working_dir, file))
  template = File.join(template_dir, template)
  File.should exist(template)
  template_contents = File.read(template)
  file_contents.strip.should == template_contents.strip
end
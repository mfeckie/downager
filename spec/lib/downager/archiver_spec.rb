require 'spec_helper'
require 'downager/archiver'

output_file_name = Dir.pwd + '/spec/sample_output_files/zipped_directory.zip'
input_path = Dir.pwd + '/spec/sample_files/'
files_for_test = [["1.14.5", "/Users/martinfeckie/rmp/accreditus/uploads/admin/evidence_uploads/3/actions.html", "actions.html"], ["1.15.1", "/Users/martinfeckie/rmp/accreditus/uploads/admin/evidence_uploads/3/actions.html", "actions.html"], ["1.15.2", "/Users/martinfeckie/rmp/accreditus/uploads/admin/evidence_uploads/3/actions.html", "actions.html"], ["1.15.3", "/Users/martinfeckie/rmp/accreditus/uploads/admin/evidence_uploads/3/actions.html", "actions.html"], ["3.10.3", "/Users/martinfeckie/rmp/accreditus/uploads/admin/evidence_uploads/4/BloodTransfusionAudit.xlsx", "BloodTransfusionAudit.xlsx"], ["1.1.1", "/Users/martinfeckie/rmp/accreditus/uploads/admin/evidence_uploads/63/GhostData.json", "GhostData.json"], ["1.1.1", "/Users/martinfeckie/rmp/accreditus/uploads/admin/evidence_uploads/1/actions.html", "actions.html"], ["4.12.4", "/Users/martinfeckie/rmp/accreditus/uploads/admin/evidence_uploads/4/BloodTransfusionAudit.xlsx", "BloodTransfusionAudit.xlsx"], ["7.3.2", "/Users/martinfeckie/rmp/accreditus/uploads/admin/evidence_uploads/4/BloodTransfusionAudit.xlsx", "BloodTransfusionAudit.xlsx"], ["7.4.1", "/Users/martinfeckie/rmp/accreditus/uploads/admin/evidence_uploads/1/actions.html", "actions.html"], ["7.5.1", "/Users/martinfeckie/rmp/accreditus/uploads/admin/evidence_uploads/1/actions.html", "actions.html"], ["8.7.1", "/Users/martinfeckie/rmp/accreditus/uploads/admin/evidence_uploads/4/BloodTransfusionAudit.xlsx", "BloodTransfusionAudit.xlsx"], ["10.2.1", "/Users/martinfeckie/rmp/accreditus/uploads/admin/evidence_uploads/4/BloodTransfusionAudit.xlsx", "BloodTransfusionAudit.xlsx"], ["10.5.2", "/Users/martinfeckie/rmp/accreditus/uploads/admin/evidence_uploads/4/BloodTransfusionAudit.xlsx", "BloodTransfusionAudit.xlsx"], ["10.8.1", "/Users/martinfeckie/rmp/accreditus/uploads/admin/evidence_uploads/4/BloodTransfusionAudit.xlsx", "BloodTransfusionAudit.xlsx"]]



describe Archiver do

  after :each do
    File.delete(Dir.pwd + '/spec/sample_output_files/zipped_directory.zip')
  end

  it "shows where I am" do
    Zip::File.open(output_file_name, Zip::File::CREATE) do |zipfile|
      Dir[File.join(input_path, '**', '**')].each do |file|
        zipfile.add(file.sub(input_path, ''), file)
      end
    end
    output_file_list = Dir.entries(Dir.pwd + '/spec/sample_output_files/')
    expect(output_file_list.include?('zipped_directory.zip')).to eq(true)
  end

  it "creates directories" do
    Zip::File.open(output_file_name, Zip::File::CREATE) do |zipfile|
      files_for_test.each do |file|
        zipfile.add("#{file[0]}/#{file[2]}", file[1])
      end
    end

  end

end
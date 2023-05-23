require 'spec_helper'

RSpec.describe "File detection for viewing", :type => :aruba do
  include_context "messages"
  include_context "texmf"

  context "File *.html" do
    before(:each) do
      run_texdoc "-dview --just-view", sample_html
    end

    it "should be opened with the viewer_html" do
      expect(stderr).to include(
        debug_line "view", 'Using "viewer_html" to open the file.')
      expect(last_command_started).to be_successfully_executed
    end
  end

  context "File *.htm" do
    before(:each) do
      run_texdoc "-dview --just-view", sample_htm
    end

    it "should be opened with the viewer_html" do
      expect(stderr).to include(
        debug_line "view", 'Using "viewer_html" to open the file.')
      expect(last_command_started).to be_successfully_executed
    end
  end

  context "File *.dvi" do
    before(:each) do
      run_texdoc "-dview --just-view", sample_dvi
    end

    it "should be opened with the viewer_dvi" do
      expect(stderr).to include(
        debug_line "view", 'Using "viewer_dvi" to open the file.')
      expect(last_command_started).to be_successfully_executed
    end
  end

  context "File *.md" do
    before(:each) do
      run_texdoc "-dview --just-view", sample_md
    end

    it "should be opened with the viewer_md" do
      expect(stderr).to include(
        debug_line "view", 'Using "viewer_md" to open the file.')
      expect(last_command_started).to be_successfully_executed
    end
  end

  context "File *.txt" do
    before(:each) do
      run_texdoc "-dview --just-view", sample_txt
    end

    it "should be opened with the viewer_txt" do
      expect(stderr).to include(
        debug_line "view", 'Using "viewer_txt" to open the file.')
      expect(last_command_started).to be_successfully_executed
    end
  end

  context "File *.pdf" do
    before(:each) do
      run_texdoc "-dview --just-view", sample_pdf
    end

    it "should be opened with the viewer_pdf" do
      expect(stderr).to include(
        debug_line "view", 'Using "viewer_pdf" to open the file.')
      expect(last_command_started).to be_successfully_executed
    end
  end

  context "File *.ps" do
    before(:each) do
      run_texdoc "-dview --just-view", sample_ps
    end

    it "should be opened with the viewer_ps" do
      expect(stderr).to include(
        debug_line "view", 'Using "viewer_ps" to open the file.')
      expect(last_command_started).to be_successfully_executed
    end
  end

  context "File *.tex" do
    before(:each) do
      run_texdoc "-dview --just-view", sample_tex
    end

    it "should be opened with the viewer_txt as fallback" do
      expect(stderr).to include(
        warning_line 'No viewer defined for ".tex" files, using "viewer_txt" instead.')
      expect(last_command_started).to be_successfully_executed
    end
  end
end

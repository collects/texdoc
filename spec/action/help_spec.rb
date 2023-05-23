require 'spec_helper'

RSpec.describe 'The "help" action', :type => :aruba do
  include_context "messages"

  let(:help_text) do
    <<~EXPECTED
      Usage: texdoc [OPTION]... NAME...
         or: texdoc [OPTION]... ACTION

      Try to find appropriate TeX documentation for the specified NAME(s).
      Alternatively, perform the given ACTION and exit.

      Options:
        -w, --view        Use view mode: start a viewer. (default)
        -m, --mixed       Use mixed mode (view or list).
        -l, --list        Use list mode: show a list of results.
        -s, --showall     Use showall mode: show also "bad" results.

        -i, --interact    Use interactive menus. (default)
        -I, --nointeract  Use plain lists, no interaction required.
        -M, --machine     Machine-readable output for lists (implies -I).

        -q, --quiet       Suppress warnings and most error messages.
        -v, --verbose     Print additional information (e.g., viewer command).
        -D, --debug       Activate all debug output (equal to "--debug=all").
        -d LIST, --debug=LIST
                          Activate debug output restricted to LIST.
        -c NAME=VALUE     Set configuration item NAME to VALUE.

      Actions:
        -h, --help        Print this help message.
        -V, --version     Print the version number.
        -f, --files       Print the list of configuration files used.
        --just-view FILE  Display FILE, given with full path (no searching).
        --print-completion SHELL
                          Print SHELL completion.

      Full manual available via `texdoc texdoc'.

      Website: <https://tug.org/texdoc/>
      Repository: <https://github.com/TeX-Live/texdoc>
      Please email bugs to <texdoc@tug.org>.
    EXPECTED
  end

  context "with --help" do
    before(:each) { run_texdoc "--help" }

    it do
      expect(stdout).to eq help_text
      expect(last_command_started).to be_successfully_executed
    end
  end

  context "with -h" do
    before(:each) { run_texdoc "-h" }

    it do
      expect(stdout).to eq help_text
      expect(last_command_started).to be_successfully_executed
    end
  end

  context "with -h -l" do
    before(:each) { run_texdoc "-h -l" }

    it do
      expect(stdout).to eq help_text
      expect(last_command_started).to be_successfully_executed
    end
  end
end

require 'vimrunner'
require 'vimrunner/rspec'
require_relative './support/vim'

Vimrunner::RSpec.configure do |config|
  config.reuse_server = true

  plugin_path = File.expand_path('.')

  config.start_vim do
    vim = Vimrunner.start_gvim
    vim.add_plugin(plugin_path, 'plugin/deleft.vim')

    if vim.echo('exists(":packadd")').to_i > 0
      vim.command('packadd matchit')
    else
      vim.command('runtime plugin/matchit.vim')
    end

    vim
  end
end

RSpec.configure do |config|
  config.include Support::Vim
end

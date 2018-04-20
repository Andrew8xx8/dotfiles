# The original idea were grabbed from:
#   https://github.com/skwp/dotfiles/blob/master/Rakefile

require 'rake'
require 'erb'

desc "Hook our dotfiles into system-standard positions."
task :install, :email, :username do |t, args|
  args.with_defaults(email: "avk@8xx8.ru", fullname: "Andreww8xx8")

  puts
  puts "=============================================================================="
  puts ""
  puts "                       ( . )  __  __  __  __  ( . )"
  puts "                      /  o  \\ \\ \\/ /  \\ \\/ / /  o  \\"
  puts "                      \\__ __//__/\\__\\/__/\\__\\\\_____/"
  puts ""
  puts "------------------------------------------------------------------------------"
  puts "  This is my personal dotfiles installer"
  puts ""
  puts "  Inspired (and sometimes copy&pasted) by:"
  puts "    https://github.com/thoughtbot/dotfiles"
  puts "    https://github.com/robbyrussell/oh-my-zsh"
  puts "    https://github.com/spf13/spf13-vim"
  puts "    https://github.com/akalyaev/dotfiles"
  puts ""
  puts "  You can find me at http://8xx8.ru"
  puts ""
  puts "=============================================================================="
  puts " Installing dotfiles"

  process_templates Dir.glob("#{ENV["PWD"]}/**/.*.erb"), args
  install_files Dir.glob("#{ENV["PWD"]}/**/.*.symlink")
  install_file "#{ENV["PWD"]}/vim/.vimrc.symlink", "#{ENV["HOME"]}/.nvimrc"
  install_vim

  puts "Installation finished successfully."
  puts "Restart your terminal.             "
  puts "Enjoy!.                            "
  puts
end

task :default => 'install'

private

  def run(cmd)
    puts "[Running] #{cmd}"
    `#{cmd}` unless ENV['DEBUG']
  end

  def process_templates(files, args)
    @user = args

    files.each do |f|
      result = ERB.new(File.read(f)).result(binding)
      result_file = f.chomp(File.extname(f))
      File.open(result_file, 'w+') do |file|
        file.write(result)
      end
    end
  end

  def install_files(files, method = :symlink)
    files.each do |f|
      file = File.basename(f, '.*')
      source = f
      target = "#{ENV["HOME"]}/#{file}"

      install_file(source, target, method)
    end
  end

  def install_file(source, target, method = :symlink)
    puts ""
    puts " #{method == :symlink ? 'Link' : 'Copy' } file #{file} "
    puts " #{source} => #{target}"
    puts ""

    if File.exists?(target) && (!File.symlink?(target) || (File.symlink?(target) && File.readlink(target) != source))
      puts " * [Overwriting] #{target}...leaving original at #{target}.backup..."
      run %{ mv "$HOME/#{file}" "$HOME/#{file}.backup" }
    end

    if method == :symlink
      run %{ ln -nfs "#{source}" "#{target}" }
    else
      run %{ cp -f "#{source}" "#{target}" }
    end
  end

  def install_vim
    run %{ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim }
    run %{ mkdir -P ~/.config/nvim/ }
    install_file "#{ENV["PWD"]}/vim/init.vim", "#{ENV["HOME"]}/.config/nvim"
  end

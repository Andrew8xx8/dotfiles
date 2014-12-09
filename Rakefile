# The original idea were grabbed from:
#   https://github.com/skwp/dotfiles/blob/master/Rakefile

require 'rake'
require 'erb'

desc "Hook our dotfiles into system-standard positions."
task :install, :email, :username do |t, args|
  args.with_defaults(email: "avk@8xx8.ru", fullname: "Andreww8xx8")

  puts
  puts "+=============================================================================="
  puts "|"
  puts "|                       ( . )  __  __  __  __  ( . )"
  puts "|                      /  o  \\ \\ \\/ /  \\ \\/ / /  o  \\"
  puts "|                      \\__ __//__/\\__\\/__/\\__\\\\_____/"
  puts "|"
  puts "+------------------------------------------------------------------------------"
  puts "|  This is my personal dotfiles installer"
  puts "|"
  puts "|  Inspired (and sometimes copy&pasted) by:"
  puts "|    https://github.com/thoughtbot/dotfiles"
  puts "|    https://github.com/robbyrussell/oh-my-zsh"
  puts "|    https://github.com/spf13/spf13-vim"
  puts "|    https://github.com/akalyaev/dotfiles"
  puts "|"
  puts "|  You can find me at http://8xx8.ru"
  puts "|"
  puts "+=============================================================================="
  puts "| Installing dotfiles"
  puts "+------------------------------------------------------------------------------"

  process_templates(Dir.glob("#{ENV["PWD"]}/**/.*.erb"), args)
  file_operation(Dir.glob("#{ENV["PWD"]}/**/.*.symlink"))

  `git config merge.conflictstyle diff3`
  `git config mergetool.prompt false`
  `git mergetool`

  puts "|"
  puts "+------------------------------------------------------------------------------"
  puts "| Installation finished successfully."
  puts "| Restart your terminal.             "
  puts "| Enjoy!.                            "
  puts "+========================================================+"
  puts
end

task :default => 'install'

private

  def run(cmd)
    puts "| [Running] #{cmd}"
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

  def file_operation(files, method = :symlink)
    files.each do |f|
      file = File.basename(f, '.*')
      source = f
      target = "#{ENV["HOME"]}/#{file}"

      puts "+------------------------------------------------------------------------------"
      puts "|"
      puts "| File: #{file}"
      puts "| Source: #{source}"
      puts "| Target: #{target}"
      puts "|"

      if File.exists?(target) && (!File.symlink?(target) || (File.symlink?(target) && File.readlink(target) != source))
        puts "| * [Overwriting] #{target}...leaving original at #{target}.backup..."
        run %{ mv "$HOME/#{file}" "$HOME/#{file}.backup" }
      end

      if method == :symlink
        run %{ ln -nfs "#{source}" "#{target}" }
      else
        run %{ cp -f "#{source}" "#{target}" }
      end
    end
  end

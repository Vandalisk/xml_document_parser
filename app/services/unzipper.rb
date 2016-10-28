class Unzipper
  def initialize(file_name)
    @file_name = file_name
  end

  def self.unzip!
    extension = @file_name.split('.').last

    case extension
    when 'rar'
      start_message
      unrar_file!
      finish_message
    when 'zip'
      start_message
      unzip_file!
      finish_message
    else
      puts "Sorry this extension of file is not supported."
    end
  end

  private

  def unzip_file!
    system("unzip #{@file_name} -d public/unzip_files/")
  end

  def unrar_file!
    system("unrar e #{@file_name} public/unrar_files/")
  end

  def start_message
    Rails.logger.info "#{'=' * 30} File #{@file_name} is started unpacking #{'=' * 30}"
  end

  def finish_message
    Rails.logger.info "#{'=' * 30} File #{@file_name} is unpacked #{'=' * 30}"
  end
end

require "yaml"

module ReaverTools
  def self.load_conf
    file_name = File.join(ENV["HOME"], ".reaver-tools.conf")
    YAML.load(File.open(file_name)).tap do |h|
      h["cache_dir"] ||= File.join(ENV["HOME"], "reaver-cache")
      h["list"] ||= {}
      h["list"]["num_sec"]   ||= 60
      h["list"]["temp_name"] ||= "reaver-list-temp"
      h["run"] ||= {}
      h["run"]["extra_args"] ||= []
    end
  end

  def self.make_session_path(cache_dir, bssid)
    File.join(cache_dir, make_session_file_name(bssid))
  end
  def self.make_session_file_name(bssid)
    "#{bssid.delete(":")}.wpc"
  end

  def self.make_disabled_session_path(cache_dir, bssid)
    File.join(cache_dir, make_disabled_session_file_name(bssid))
  end
  def self.make_disabled_session_file_name(bssid)
    "_" + make_session_file_name(bssid)
  end
end

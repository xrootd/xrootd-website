#-------------------------------------------------------------------------------
# Author: Lukasz Janyst <ljanyst@cern.ch>
#
# Autogeneration stuff, we really should use tags, not filters, but tags
# cannot access the global config
#-------------------------------------------------------------------------------

require 'digest/md5'

#-------------------------------------------------------------------------------
# Assign comments to filenames
#-------------------------------------------------------------------------------
def tar_name_to_comment( name )
  if name.include?( "rhel5-32" )
    return "Linux RHEL5 32bits"
  elsif name.include?( "rhel5-64" )
    return "Linux RHEL5 64bits"
  elsif name.include?( "rhel6-32" )
    return "Linux RHEL6 32bits"
  elsif name.include?( "rhel6-64" )
    return "Linux RHEL6 64bits"
  elsif name.include?( "sun4x_510" )
    return "Solaris Sparc"
  elsif name.include?( "sunx86_510" )
    return "Solaris x86"
  end
end

#-------------------------------------------------------------------------------
# Build download link
#-------------------------------------------------------------------------------
def download_link( fileName, version )
  link = "[#{fileName}](/download/v#{version}/#{fileName})"
end

module Jekyll
  module XRootDFilter

    #---------------------------------------------------------------------------
    # Print a URL of the latest version
    #---------------------------------------------------------------------------
    def latest_release_url( input )
      site = @context.registers[:site]
      lv   = site.config['latest_release']
      file = "download/v#{lv}/xrootd-#{lv}.tar.gz"
      if File.exists?( "#{site.dest}/#{file}" )
        "[xrootd-#{lv}.tar.gz](/#{file})"
      else
        "Archive file does not exist"
      end
    end

    #---------------------------------------------------------------------------
    # Generate the table of release source tarballs
    #---------------------------------------------------------------------------
    def tar_gz_files_table( input )
      site     = @context.registers[:site]
      lv       = site.config['latest_release_tar_gz']
      path     = "download/v#{lv}"
      fullPath = "#{site.dest}/#{path}"

      if not File.exists?( fullPath ) or not File.directory?( fullPath )
        return "Archives not present"
      end

      #-------------------------------------------------------------------------
      # Build the list of files to display
      #-------------------------------------------------------------------------
      rows = []
      dirContents = Dir.entries( fullPath )
      dirContents.each do |entry|
        if entry.end_with?( "_dbg.tar.gz" )
          row = {}
          row['date'] = File.mtime( "#{fullPath}/#{entry}" ).strftime( "%Y-%m-%d" )
          row['size'] = File.size( "#{fullPath}/#{entry}" )
          row['md5']  = Digest::MD5.hexdigest( File.read( "#{fullPath}/#{entry}" ) )
          row['link'] = download_link( entry, lv )
          row['comment'] = tar_name_to_comment( entry )
          rows << row
        end
      end

      #-------------------------------------------------------------------------
      # Do we have any binaries?
      #-------------------------------------------------------------------------
      if rows.empty?()
        return "No archives to are available for version #{lv}"
      end

      #-------------------------------------------------------------------------
      # Build the header
      #-------------------------------------------------------------------------
      output =  "|Date|File|Size|Checksum|Comment|\n"
      output += "|:-:|:-:|:-:|:-:|:-:|\n"
      rows.each do |row|
        output += "|#{row['date']}|#{row['link']}|#{row['size']} bytes"
        output += "|#{row['md5']}|#{row['comment']}|\n"
      end
      return output
    end

  end
end

Liquid::Template.register_filter( Jekyll::XRootDFilter )

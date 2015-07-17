module S3
  def S3.set_directory
    connection = Fog::Storage.new({
      :provider                 => 'AWS',
      :aws_access_key_id        => ENV['S3_ACCESS_KEY_ID'],
      :aws_secret_access_key    => ENV['S3_SECRET_ACCESS_KEY']
    })

    directory = connection.directories.create(
      :key    => "guessapp", # globally unique name
      :public => true
    )

    return directory
  end

  def S3.image_upload(directory, movie_image_name, absolute_local_path_to_image)
    file = directory.files.create(
      :key    => movie_image_name,
      :body   => File.open(absolute_local_path_to_image),
      :public => true
    )
  end
end
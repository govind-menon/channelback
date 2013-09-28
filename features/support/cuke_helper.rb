
def path_of(path_name)
  path_mapping = {'posts' => posts_path,'user_sign_in' => sign_in_path}
  path_mapping[path_name]
end
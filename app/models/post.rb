class Post < ApplicationRecord
  mount_uploader :img, PostUploader
end
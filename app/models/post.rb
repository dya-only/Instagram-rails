class Post < ApplicationRecord
  mount_uploader :img, PostUploader
  belongs_to :user, optional: true
end
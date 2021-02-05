class Uploader < ApplicationRecord
    has_one_attached :image
    mount_uploader :image, ImagesUploader
end

class ExternalFile < ApplicationRecord
  mount_uploader :file, AttachmentUploader
end

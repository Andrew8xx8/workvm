maintainer       "Andrew Kulakov"
maintainer_email "avk@8xx8.ru"
license          "MIT License"
description      "General work machine"
version          "0.1"

%w{ apt zsh }.each do |cb_depend|
  depends cb_depend
end

%w{ debian ubuntu }.each do |os|
  supports os
end

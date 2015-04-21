name             'crowi'
maintainer       'Daichi Kamemoto'
maintainer_email 'daikame@gmail.com'
license          'MIT'
description      'Installs/Configures crowi'
long_description 'Installs/Configures crowi'
version          '0.1.0'

depends          'apt'
depends          'build-essential'
depends          'mongodb'
depends          'ark'
depends          'nodejs'

%w(debian ubuntu).each do |os|
  supports os
end


#
# Author:: Sergio Rubio, Massimo Maino (<maintux@gmail.com>)
# Copyright:: Sergio Rubio, Massimo Maino (c) 2011
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'chef/knife/esx_base'

class Chef
  class Knife
    class EsxTemplateList < Knife

      include Knife::ESXBase

      banner "knife esx template list"

      def run
        $stdout.sync = true
        table = table do |t|
          t.headings = %w{DISK_TEMPLATES}
          connection.list_templates.each do |tmpl|
            t << [File.basename(tmpl)]
          end
        end
        puts table
      end

    end
  end
end

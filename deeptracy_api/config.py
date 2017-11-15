# Copyright 2017 BBVA
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

import os


BROKER_URI = os.environ.get('BROKER_URI')
DATABASE_URI = os.environ.get('DATABASE_URI')
LOG_LEVEL = os.environ.get('LOG_LEVEL')
ALLOWED_SCANS_PER_PERIOD = os.environ.get('ALLOWED_SCANS_PER_PERIOD', 1)
ALLOWED_SCANS_CHECK_PERIOD = os.environ.get('ALLOWED_SCANS_CHECK_PERIOD', 5)  # in minutes

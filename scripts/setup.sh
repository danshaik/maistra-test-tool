#!/bin/bash

# Copyright 2019 Red Hat, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http:#www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# install runtime
sudo dnf install -y awscli
sudo dnf install -y python37
sudo dnf install -y golang

# install Go packages
go get "istio.io/istio/tests/util"
go get "istio.io/istio/pkg/log"
go get "golang.org/x/net/publicsuffix"
go get "github.com/knrc/registry-puller"

# install pipenv
sudo pip3 install pipenv

# install pip packages
pushd $(cd $(dirname $0); pwd -P)/../install
pipenv install
pipenv shell
popd

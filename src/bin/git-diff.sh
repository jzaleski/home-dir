#!/bin/bash

diff_cmd="`which git` diff";

$diff_cmd --exit-code && $diff_cmd --cached;

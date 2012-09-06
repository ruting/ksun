package com.megatome.grails.mailhide.util

/**
 * Copyright 2010 Megatome Technologies
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

class StringUtils {
  public static final int DEFAULT_BLOCK_SIZE = 16

  static def padString(def str) {
    padString (str, DEFAULT_BLOCK_SIZE)
  }

  static def padString(def str, def blockSize) {
    def numpad = blockSize - (str.size() % blockSize)
    def padded = str
    (1..numpad).each {
      padded += (numpad as char)
    }
    padded
  }
}

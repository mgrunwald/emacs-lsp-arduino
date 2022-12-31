;;; lsp-arduino.el --- description -*- lexical-binding: t; -*-

;; Copyright (C) 2022 Markus Grunwald

;; Author: Markus Grunwald
;; Keywords: lsp, arduino

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; LSP Client for the Arduino build tool.

;;; Code:

(require 'lsp-mode)
(require 'lsp-completion)

(defgroup lsp-arduino nil
  "LSP support for Arduino, using arduino-language-server."
  :group 'lsp-mode
  :link '(url-link
          "https://github.com/arduino/arduino-language-server")
  )

(defcustom lsp-arduino-server-path "arduino-language-server"
  "Path to arduino-language-server binary."
  :group 'lsp-arduino
  :type 'file
  :group 'lsp-arduino
  )

(defcustom lsp-arduino-server-args nil
  "Extra CLI arguments for arduino-language-server."
  :type '(repeat string)
  :group 'lsp-arduino)


(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-language-id-configuration
               '(arduino-mode . "arduino"))
  )

(lsp-register-client
 (make-lsp-client :new-connection (lsp-stdio-connection
                                   (lambda () (cons lsp-arduino-server-path lsp-arduino-server-args)))
                  :major-modes '(arduino-mode)
                  :priority -1
                  :server-id 'arduinols))

(lsp-consistency-check lsp-arduino)

(provide 'lsp-arduino)
;;; lsp-arduino.el ends here

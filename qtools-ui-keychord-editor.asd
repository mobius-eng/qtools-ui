#|
 This file is a part of Qtools-UI
 (c) 2015 Shirakumo http://tymoon.eu (shinmera@tymoon.eu)
 Author: Nicolas Hafner <shinmera@tymoon.eu>
|#

(in-package #:cl-user)
(asdf:defsystem qtools-ui-keychord-editor
  :license "Artistic"
  :author "Nicolas Hafner <shinmera@tymoon.eu>"
  :maintainer "Nicolas Hafner <shinmera@tymoon.eu>"
  :description "A basic editor for keychords generated by Qtools' define-menu."
  :homepage "https://github.com/Shinmera/qtools-ui"
  :serial T
  :components ((:file "keychord-editor"))
  :depends-on (:qtools-ui-base))

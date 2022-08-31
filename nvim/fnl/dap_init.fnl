(local dap (require :dap))

(tset dap.adapters :lldb {
  :type "executable"
  :command "/usr/bin/lldb-vscode"
  :name "lldb"
})

;; (tset dap.adapters :delve {
;;   :type "server"
;;   :port "${port}"
;;   :executable {
;;     :command "dlv"
;;     :args [ "dap" "-l" "127.0.0.1:${port}"]
;;   }
;; })
;;
(tset dap.adapters :rdbg
  (fn [callback config]
    (callback {
      :type "server"
      :host "127.0.0.1"
      :port "${port}"
      :executable {
        :command "rdbg"
        :args ["--open" "--port" "${port}"
                ;; "-c" "--" config.command config.script]
                 config.script]
      }
    })))

(tset dap.configurations :cpp [
  {
    :name "Launch"
    :type "lldb"
    :request "launch"
    :program "./a.out"
    ;; :program #(vim.fn.input
    ;;      "Path to executable: " (.. (vim.fn.getcwd) "/") "file")
    :cwd "${workspaceFolder}"
    :stopOnEntry false
    :args []
    ;; :runInTerminal true
  }
])
;; (tset dap.configurations :c dap.configurations.cpp)
;; (tset dap.configurations :rust dap.configurations.cpp)

;; (tset dap.configurations :go [
;;   {
;;     :type "delve"
;;     :name "Debug"
;;     :request "launch"
;;     :program "${file}"
;;   }
;;   {
;;     :type "delve"
;;     :name "Debug test"
;;     :request "launch"
;;     :mode "test"
;;     :program "${file}"
;;   }
;; ])

(tset dap.configurations :ruby [
  {
    :type "rdbg"
    :name "debug current file"
    :request "attach"
    :localfs true
    :command "ruby"
    :script "${file}"
  }
])

(local dapui (require :dapui))
(dapui.setup {
  :mappings {
    :expand [ "<Tab>" "<2-LeftMouse>"]
    :open "o"
    :remove "d"
    :edit "e"
    :repl "r"
    :toggle "t"
  }
  :layouts [
    {
      :elements [
        { :id "breakpoints" :size 0.25 }
        { :id "stacks" :size 0.25 }
        { :id "watches" :size 0.25 }
        { :id "scopes" :size 0.25 }
      ]
      :size 60
      :position "left"
    }
    {
      :elements [
        "repl"
        "console"
      ]
      :size 0.25
      :position "bottom"
    }
  ]
})

(tset dap.listeners.after.event_initialized :dapui_config #(dapui.open))

(tset dap.listeners.before.event_terminated :dapui_config #(dapui.close))

(tset dap.listeners.before.event_exited :dapui_config #(dapui.close))

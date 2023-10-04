return {
  lsp = {
    server = "pyright",
    config = {
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "off",
          },
        },
      },
    }
  },
  formatter = nil
}

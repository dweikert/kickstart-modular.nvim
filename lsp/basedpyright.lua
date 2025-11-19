return {
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = 'basic',
        diagnosticMode = 'openFilesOnly',
        autoImportCompletion = true,
        diagnosticSeverityOverrides = {
          reportUnusedVariable = 'none',
          reportUnusedImport = 'none',
          reportUnusedFunction = 'none',
          reportUnusedClass = 'none',
          reportPrivateImportUsage = 'none',
          reportPrivateUsage = 'none',
          reportDuplicateImport = 'none',
        },
      },
    },
  },
}

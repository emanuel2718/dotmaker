return {
  checkOnSave = {
    allFeatures = true,
    overrideCommand = {
      'cargo', 'clippy', '--message-format=json'
    }
  }
}

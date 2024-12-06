{ inputs, ... }: {
  # MimeType
  xdg.mimeApps = {
    enable = true;
    associations.added = { };
    defaultApplications = { };
  };
}

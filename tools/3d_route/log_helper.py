import logging

_trace_installed = False
def install_trace_logger():
    global _trace_installed
    if _trace_installed:
        return
    logging.TRACE = logging.DEBUG - 5
    level = logging.DEBUG - 5

    def log_logger(self, message, *args, **kwargs):
        if self.isEnabledFor(level):
            self._log(level, message, args, **kwargs)
    logging.getLoggerClass().trace = log_logger

    def log_root(msg, *args, **kwargs):
        logging.log(level, msg, *args, **kwargs)
    logging.addLevelName(level, "TRACE")
    logging.trace = log_root
    _trace_installed = True

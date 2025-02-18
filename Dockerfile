FROM alpine:latest

RUN apk add git nodejs neovim ripgrep build-base wget python3 py3-pip --update

COPY requirements.txt .
RUN pip install -r --break-system-packages requirements.txt

RUN git clone https://github.com/NvChad/starter .config/nvim && \
    nvim --headless -c 'LazyVimSync; MasonInstallAll; MasonInstall pyright; MasonInstall ruff; q'

ENTRYPOINT ["/bin/sh"]

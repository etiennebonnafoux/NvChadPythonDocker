FROM alpine:latest

# Create user and group
RUN addgroup -S myuser && adduser -S -G myuser myuser

# Create a temporary directory owned by myuser
RUN mkdir -p /tmp/app && chown -R myuser:myuser /tmp/app

USER myuser

WORKDIR /tmp/app

RUN apk add git nodejs neovim ripgrep build-base wget python3 py3-pip --update

COPY requirements.txt .
RUN pip install -r requirements.txt

RUN git clone https://github.com/NvChad/starter .config/nvim && \
    nvim --headless -c 'LazyVimSync; MasonInstallAll; MasonInstall pyright; MasonInstall ruff; q'

ENTRYPOINT ["/bin/sh"]

FROM alpine:latest

RUN apk add git nodejs npm neovim ripgrep build-base wget python3 py3-pip --update

COPY requirements.txt .

RUN pip install pynvim --break-system-packages --no-cache-dir

RUN git clone https://github.com/NvChad/starter /root/.config/nvim 
    
RUN nvim --headless  '+Lazy! sync' +MasonInstallAll +qa

#RUN nvim --headless -c 'MasonInstallAll'
#RUN nvim --headless -c 'MasonInstall pyright'
#RUN nvim --headless -c 'MasonInstall ruff'
#RUN nvim --headless -c 'q'


ENTRYPOINT ["/bin/sh"]

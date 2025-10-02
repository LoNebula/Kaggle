# 1. ベースイメージの選択
# NVIDIAが提供する公式CUDAイメージを選択します。
# devel版にはコンパイラ(nvcc)や開発用ライブラリが含まれています。
FROM nvidia/cuda:12.1.1-devel-ubuntu22.04

# 2. タイムゾーンなどの設定（オプション）
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 3. 必要なパッケージのインストール
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    vim \
    && rm -rf /var/lib/apt/lists/*

# 4. Pythonライブラリのインストール
# PyTorchをCUDA 12.1対応版でインストールします
RUN pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121

# 5. 作業ディレクトリの指定
WORKDIR /workspace

# 6. コンテナ起動時のデフォルトコマンド（オプション）
CMD ["/bin/bash"]
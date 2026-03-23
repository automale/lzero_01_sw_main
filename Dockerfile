# L-ZERO System SW Track - xv6 (RISC-V) Development Environment
# OS: Ubuntu 24.04 LTS (QEMU 8.x 버전을 기본으로 지원하여 timerinit 하드웨어 폴트 방지)
FROM ubuntu:24.04

# apt-get 설치 중 타임존이나 키보드 설정 프롬프트로 인해 빌드가 멈추는 것을 방지
ENV DEBIAN_FRONTEND=noninteractive

# 패키지 목록 업데이트 및 필수 툴체인 설치
RUN apt-get update && apt-get install -y \
    build-essential \
    clang \
    lld \
    llvm \
    qemu-system-misc \
    bc \
    binutils-riscv64-linux-gnu \
    gdb-multiarch \
    git \
    python3 \
    perl \
    && rm -rf /var/lib/apt/lists/*

# 작업 디렉토리 설정 (컨테이너 진입 시 기본 경로)
WORKDIR /workspaces/lzero_01_sw_main

# 컨테이너 실행 시 기본으로 띄울 쉘
CMD ["/bin/bash"]
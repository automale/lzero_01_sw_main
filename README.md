# lzero_01_sw
lzero sw track

## 📚 Study Resources
우리 트랙의 원활한 진행을 위해 아래 자료들을 참고하는 것을 권장합니다.
- **Main Textbook:** [OSTEP](https://ostep.org/book.html) (무료 PDF)
- **Reference Course:** [MIT 6.S081 (RISC-V)](https://pdos.csail.mit.edu/6.S081/)
- **xv6 Handbook:** 프로젝트 루트의 `xv6-riscv-book.pdf` (소스코드 해설서)

# 🐧 L-ZERO System SW Track: xv6 개발 환경 설정 가이드

본 저장소는 MIT의 **xv6-riscv** 운영체제를 분석하고, System Call 및 Memory Management 등 커널 레벨의 개발을 실습하기 위한 통합 환경입니다. Docker를 통해 복잡한 크로스 컴파일러(RISC-V 툴체인)와 QEMU 설치를 자동화합니다.

---

## 📋 1. 사전 준비 (Prerequisites)
시작 전 아래 도구들이 설치되어 있어야 합니다.
* **Docker Desktop**: 컨테이너 기반 개발 환경 실행
* **Git**: 소스 코드 버전 관리

---

## 🛠️ 2. 저장소 복제 (Fork & Clone)

본인의 계정에서 xv6 코드를 수정하고 과제를 제출하기 위해 **저장소를 Fork** 해야 합니다.

### ① GitHub에서 Fork 수행
1. L-ZERO SW 트랙 메인 레포지토리(`lzero_01_sw_main`)를 자신의 계정으로 **Fork** 합니다.

### ② 로컬로 복제 (Clone)
```bash
# 본인의 포크된 레포지토리 주소를 사용하세요.
git clone [https://github.com/YOUR_USERNAME/lzero_01_sw_main.git](https://github.com/YOUR_USERNAME/lzero_01_sw_main.git)
cd lzero_01_sw_main
```

---

## 🚢 3. 환경 빌드 및 실행 (Docker)
L-ZERO 전용 Makefile을 통해 환경 구축을 단 한 줄로 끝냅니다.
```bash
make up
```
Ubuntu 24.04 기반에 RISC-V 툴체인과 QEMU 8.x가 포함된 이미지를 빌드하고 백그라운드에서 실행합니다. (최초 1회 약 1~2분 소요)

---

## ⌨️ 4. 주요 명령어 사용법 (Makefile)
터미널에서 아래 명령어를 사용하여 OS 개발 및 테스트를 진행하세요.

make up Docker          컨테이너 실행 및 환경 빌드
make shell컨테이너        내부 터미널 접속 (권장)
make qemuxv6            커널을 컴파일하고 QEMU 에뮬레이터로 부팅
make qemu-gdb           GDB 디버거를 연결하기 위해 대기 상태로 QEMU 부팅
make clean              xv6 빌드 부산물(.o, .d, xv6.img 등) 삭제
make fclean             컨테이너/이미지/볼륨 완전 삭제 (환경 완전 초기화)
make down               컨테이너 실행 종료

---

## 💡 5. 개발 워크플로우 (Example)
커널 부팅 테스트: 터미널에서 make qemu를 입력하여 xv6 쉘($)이 뜨는지 확인합니다.

코드 수정: 로컬 에디터(VS Code 등)에서 kernel/ 또는 user/ 디렉토리의 C 코드를 수정합니다. (컨테이너 내부와 실시간 연동됨)

재컴파일 및 확인: 다시 make qemu를 실행하여 변경된 커널을 테스트합니다.

QEMU 종료: xv6 쉘에서 Ctrl + A를 누른 뒤, 손을 떼고 X를 누르면 QEMU가 종료됩니다.
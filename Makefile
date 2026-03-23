# L-ZERO System SW Track (xv6) 간편 명령어 세트

# 1. 환경 빌드 및 실행
up:
	docker compose up -d --build

# 2. 컨테이너 내부 접속 (터미널에서 직접 코드 작성 및 디버깅할 때)
shell:
	docker exec -it lzero_sw_env /bin/bash

# 3. xv6 컴파일 및 QEMU 부팅 (밖에서 바로 실행)
qemu:
	docker exec -it lzero_sw_env make qemu

# 4. xv6 GDB 디버깅 모드 실행 (터미널 2개 필요)
# 첫 번째 터미널에서 실행 후 대기
qemu-gdb:
	docker exec -it lzero_sw_env make qemu-gdb

# 5. 청소
# 5-1. 컴파일된 커널 및 오브젝트 파일 삭제
clean:
	docker exec -it lzero_sw_env make clean

# 5-2. 컨테이너, 이미지, 볼륨 완전 초기화
fclean:
	docker compose down -v --rmi all

# 6. 종료
down:
	docker compose down
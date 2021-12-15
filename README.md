## 볼링 점수판 미션 저장소
### Effective Swift with TDD, Clean Code
NEXTSTEP with yagom-academy
---
## 기능 요구사항

### 볼링 규칙
- 볼링은 총 10개의 프레임으로 이루어진다.
- 한 프레임당 2번의 기회가 주어지며, 마지막 프레임에서는 Strike or Spare상태에서 한 번의 기회가 더 주어진다. 


### 볼링 용어
- Strike : 프레임의 첫번째 투구에서 모든 핀을 쓰러트린 상태
- Spare : 프레임의 두번째 투구에서 모든 핀을 쓰러트린 상태
- Miss : 프레임의 두번째 투구에서도 모든 핀이 쓰러지지 않은 상태
- Gutter : 핀을 하나도 쓰러트리지 못한 상태

### 화면 표시
| 용어 | 표시 |
|:---:|:---:|
| Strike | X |
| Spare | 9\|/ |
| Miss | 8\|1 |
| Gutter | - |


---

## 구현 목록
### View
- InputView
    - [x] 참여자 이름 입력
    - [x] 투구 입력 (0~10)

<br>

- ResultView
    - [x] 현재 프레임 결과 출력

<br>

### Business Logic
 - 입력값 유효성 검사
    - 참여자 이름
        - [x] 빈 값인지 검사
        - [x] 이름이 3자리인지 검사

    - 투구
        - [x] 빈 값인지 검사
        - [x] 0~10 범위에 포함되는지 검사


<br>

- BowlingGame
    - [x] 플레이어 이름을 입력받는다.
    - [x] 투구를 입력받는다.
    - [x] 플레이어가 투구를 한다.
    - [x] 점수판에 현재 결과를 출력한다.

<br>

- Frame
    - [x] 프레임의 첫번째 투구에서 모든 핀을 쓰러트리면 Strike
    - [x] 프레임의 두번째 투구에서 모든 핀을 쓰러트리면 Spare
    - [x] 프레임의 두번째 투구에서도 모든 핀이 쓰러지않으면 Miss
    - [x] 핀을 하나도 쓰러트리지 못하면 Gutter

<br>

- NormalFrame
    - [x] Bowl를 갖는다.
    - [x] 2번의 투구를 하면 다음 프레임을 생성한다.

<br>

- FinalFrame
    - [x] Strike or Spare면 3번째 투구를 한다.
    - [x] 모든 투구가 끝나면 게임 종료

<br>

- Bowl
    - [x] 입력받은 투구를 갖는다.

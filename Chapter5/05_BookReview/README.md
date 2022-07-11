## 네이버 검색 Open API
- [참고](https://developers.naver.com/docs/serviceapi/search/book/book.md)
- Request URL: https://openapi.naver.com/v1/search/book.json
- HTTP Method: GET
- Parameter: Key - query(책제목)
- Header
  - curl "https://openapi.naver.com/v1/search/book.xml?query=%EC%A3%BC%EC%8B%9D&display=10&start=1" \
    -H "X-Naver-Client-Id: {애플리케이션 등록 시 발급받은 client id 값}" \
    -H "X-Naver-Client-Secret: {애플리케이션 등록 시 발급받은 client secret 값}" -v

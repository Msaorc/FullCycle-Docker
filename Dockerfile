FROM golang:1.9.6 as BUILD

WORKDIR /app
COPY main.go .
COPY go.mod .

RUN go build -o fullcycle .

FROM scratch
COPY --from=BUILD /app/fullcycle ./fullcycle

CMD [ "./fullcycle" ]

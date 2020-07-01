FROM centos:7 as base_test
RUN yum update -y && \
    yum install -y python3 && \
    pip3 install mysql-connector-python
COPY mysql_select.py mysql_select.py
RUN python3 mysql_select.py
CMD ["/bin/bash"]

FROM nginx as final
COPY --from=base_test res.html /usr/share/nginx/html/index.html
CMD ["nginx", "-g", "daemon off;"]
use wasi_http_tests::bindings::wasi::http::types::{Method, Scheme};

fn main() {
    let res = wasi_http_tests::request(
        Method::Other("OTHER".to_owned()),
        Scheme::Http,
        "localhost:3000",
        "/",
        None,
        None,
    );

    let error = res.unwrap_err();
    assert_eq!(
        error.to_string(),
        "Error::InvalidUrl(\"unknown method OTHER\")"
    );
}

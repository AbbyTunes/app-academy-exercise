
export const fetchBenches = () => (
	$.ajax({
	method: "GET",
    url: "/api/benches"
	// error: (err) => console.log(err)
	})
);

export const fetchBench = (id) => (
    $.ajax({
        method: "GET",
        url: `/api/benches/${id}`,
    })
)
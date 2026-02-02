# VictoriaMetrics

[![GitHub Stars](https://img.shields.io/github/stars/VictoriaMetrics/VictoriaMetrics?style=flat-square)](https://github.com/VictoriaMetrics/VictoriaMetrics)
[![Docker Pulls](https://img.shields.io/docker/pulls/victoriametrics/victoria-metrics?style=flat-square)](https://hub.docker.com/r/victoriametrics/victoria-metrics)

## SYNOPSIS

VictoriaMetrics is a fast, cost-saving, and scalable solution for monitoring and managing time series data. It serves as an excellent long-term storage for Prometheus metrics and can be used as a drop-in replacement for Prometheus and Graphite in Grafana.

## FEATURES

- **High Performance**: 20x faster than InfluxDB and TimescaleDB for data ingestion and querying
- **Memory Efficient**: Uses 10x less RAM than InfluxDB and up to 7x less than Prometheus
- **Excellent Compression**: Stores 70x more data points than TimescaleDB in the same storage space
- **Prometheus Compatible**: Supports PromQL and the more performant MetricsQL query language
- **Multi-Protocol Ingestion**: Accepts data from Prometheus, InfluxDB, Graphite, OpenTSDB, DataDog, OpenTelemetry
- **Easy Setup**: Single binary with no dependencies, works out of the box
- **Global Query View**: Query data from multiple Prometheus instances via a single endpoint
- **Instant Snapshots**: Backup and restore with instant snapshots for multi-terabyte datasets
- **Built-in UI**: Includes vmui web interface for querying and exploring metrics

## ENVIRONMENT

| Variable | Default | Description |
|----------|---------|-------------|
| `VICTORIAMETRICS_RETENTION_PERIOD` | `1` | Data retention period in months |
| `VICTORIAMETRICS_SELF_SCRAPE_INTERVAL` | `10s` | Interval for self-scraping internal metrics |

## USAGE

### Web Interface

Access the built-in vmui at: `http://your-server:8428/vmui`

### Prometheus Remote Write

Configure Prometheus to send metrics to VictoriaMetrics:

```yaml
remote_write:
  - url: http://victoriametrics:8428/api/v1/write
```

### Scraping Prometheus Targets (e.g., Traefik)

VictoriaMetrics can scrape Prometheus-compatible endpoints. Create a config file at:

```
/runtipi/app-data/victoriametrics/config/promscrape.yml
```

Then restart VictoriaMetrics to apply the configuration.

**Example: Scraping Traefik metrics**

```yaml
scrape_configs:
  - job_name: 'traefik'
    scrape_interval: 15s
    static_configs:
      - targets: ['traefik:8080']
    metrics_path: /metrics

  - job_name: 'node-exporter'
    scrape_interval: 30s
    static_configs:
      - targets: ['node-exporter:9100']

  - job_name: 'cadvisor'
    scrape_interval: 30s
    static_configs:
      - targets: ['cadvisor:8080']
```

> **Note**: Use container names as hostnames (e.g., `traefik`, `prometheus`) since VictoriaMetrics runs in the same Docker network.

### Grafana Integration

Add VictoriaMetrics as a Prometheus data source in Grafana:
- URL: `http://victoriametrics:8428`

### Querying Metrics

Use PromQL or MetricsQL to query your data:

```
http://your-server:8428/api/v1/query?query=up
```

### Importing Data

**Prometheus format:**
```bash
curl -d 'metric_name{label="value"} 123' http://victoriametrics:8428/api/v1/import/prometheus
```

**InfluxDB line protocol:**
```bash
curl -d 'measurement,tag=value field=123' http://victoriametrics:8428/write
```

## PORTS

| Port | Protocol | Description |
|------|----------|-------------|
| 8428 | HTTP | Main HTTP API and vmui web interface |

## DOCUMENTATION

- [Official Documentation](https://docs.victoriametrics.com/)
- [Quick Start Guide](https://docs.victoriametrics.com/victoriametrics/quick-start/)
- [MetricsQL Reference](https://docs.victoriametrics.com/victoriametrics/metricsql/)
- [Grafana Integration](https://docs.victoriametrics.com/victoriametrics/integrations/grafana/)

## LINKS

- **Source Code**: https://github.com/VictoriaMetrics/VictoriaMetrics
- **Website**: https://victoriametrics.com
- **Community**: https://slack.victoriametrics.com

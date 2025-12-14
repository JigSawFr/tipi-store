# ThingsBoard

![GitHub Stars](https://img.shields.io/github/stars/thingsboard/thingsboard?style=flat-square)
![GitHub Release](https://img.shields.io/github/v/release/thingsboard/thingsboard?style=flat-square)
![Docker Pulls](https://img.shields.io/docker/pulls/thingsboard/tb-postgres?style=flat-square)
![License](https://img.shields.io/github/license/thingsboard/thingsboard?style=flat-square)

---

## SYNOPSIS

**ThingsBoard** is an open-source IoT platform for data collection, processing, visualization, and device management. It enables you to provision and manage IoT devices, collect and visualize telemetry data with flexible dashboards, define processing rule chains, and trigger alarms based on device activity.

---

## FEATURES

- **Device Management**: Provision, monitor and control your IoT entities in a secure way using rich server-side APIs
- **Data Visualization**: Collect and store telemetry data in a scalable way, visualize with built-in or custom widgets and flexible dashboards
- **SCADA Dashboards**: Monitor and control industrial processes in real time with SCADA symbols
- **Rule Engine**: Define data processing rule chains to transform and normalize device data
- **Alarms & Notifications**: Raise alarms on telemetry events, attribute updates, device inactivity; notify via email, SMS, or third-party services
- **Multi-Protocol Support**: MQTT, CoAP, HTTP, LwM2M, SNMP, and more
- **Multi-Tenancy**: Support for multiple tenants with role-based access control

---

## ENVIRONMENT

This image includes PostgreSQL database embedded (tb-postgres variant).

### Default Credentials

After first launch, use these default accounts:

| Role | Email | Password |
|------|-------|----------|
| System Administrator | sysadmin@thingsboard.org | sysadmin |
| Tenant Administrator | tenant@thingsboard.org | tenant |
| Customer User | customer@thingsboard.org | customer |

**Important:** Change these passwords after first login!

### Ports

| Port | Protocol | Description |
|------|----------|-------------|
| 9090 | TCP | Web UI / REST API |
| 1883 | TCP | MQTT |
| 7070 | TCP | Edge RPC |
| 5683-5688 | UDP | CoAP / LwM2M |

### Data Storage

Data and logs are persisted in:
- `/data` - Database and configuration
- `/var/log/thingsboard` - Application logs

---

## LINKS

- **Documentation**: [thingsboard.io/docs](https://thingsboard.io/docs/)
- **Getting Started**: [Hello World Guide](https://thingsboard.io/docs/getting-started-guides/helloworld/)
- **GitHub**: [thingsboard/thingsboard](https://github.com/thingsboard/thingsboard)
- **Demo**: [demo.thingsboard.io](https://demo.thingsboard.io)
